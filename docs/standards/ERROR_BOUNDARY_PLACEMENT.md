# ErrorBoundary Placement Standard

## Regula #1: Nu învelești `<Routes>` cu `<AnimatePresence>`

### Problema
`<AnimatePresence mode="wait">` care învelește `<Routes>` cauzează black screen pe TOATE rutele. 
Doar bottom nav rămâne vizibil. Refresh-ul temporar rezolvă.

### Cauza
`Routes` NU e un `motion` component → framer-motion așteaptă o animație de exit care nu vine 
niciodată → blochează randarea noii rute la infinit.

### Soluția
Elimină `<AnimatePresence>` din jurul `<Routes>`. Dacă vrei page transitions, învelește fiecare 
pagină individual, nu întregul `Routes`.

```tsx
// ❌ GRESIT — black screen pe toate rutele
<AnimatePresence mode="wait">
  <Routes location={location} key={location.pathname}>
    ...
  </Routes>
</AnimatePresence>

// ✅ CORECT — Routes fără AnimatePresence
<Routes location={location} key={location.pathname}>
  ...
</Routes>
```

## Regula #2: ErrorBoundary NU învelește AnimatePresence

### Problema
ErrorBoundary cu `key={activeTab}` în jurul `AnimatePresence` → la tab switch, React demontează 
ErrorBoundary-ul (key changed), care distruge și AnimatePresence-ul → framer-motion crapă.

### Soluția
ErrorBoundary în INTERIORUL fiecărui tab, nu în jurul animației.

```tsx
// ❌ GRESIT
<ErrorBoundary key={activeTab}>
  <AnimatePresence mode="wait">
    {renderTabContent()}
  </AnimatePresence>
</ErrorBoundary>

// ✅ CORECT — ErrorBoundary per tab, AnimatePresence rămâne montat
<AnimatePresence mode="wait">
  {activeTab === 'overview' && (
    <TabTransition key="overview">
      <ErrorBoundary><OverviewTab ... /></ErrorBoundary>
    </TabTransition>
  )}
  {activeTab === 'settings' && (...)}
</AnimatePresence>
```

### Reguli generale
- `key={activeTab}` pe ErrorBoundary e anti-pattern — demontează brusc copiii
- ErrorBoundary învelește doar conținutul care poate crăpa, nu și lifecycle components gen AnimatePresence
- AnimatePresence trebuie să rămână montat stabil — nu-l învelești cu componente care se demontează

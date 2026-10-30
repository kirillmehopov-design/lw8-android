# LW8 — Defense questions

**Why ListView.separated instead of Column?** It lazily builds visible list rows and separators, reducing unnecessary widget construction.

**What does itemBuilder do?** Builds a row on demand for the requested index.

**Why crossAxisCount 2?** It displays two columns.

**What is childAspectRatio 0.72?** Card width divided by card height is 0.72.

**How does refresh work?** RefreshIndicator awaits Future.delayed(1500 milliseconds), then setState inserts the new product at index 0.

**Why use ValueKey(product.id)?** It gives each Dismissible a stable unique identity.

**How does deletion work?** Swipe endToStart (right-to-left) reveals a red delete background, then onDismissed removes the product.

**How does UNDO work?** We capture the removed item and its old index, then insert it back using setState.

**What happens with zero products?** Catalog is Empty displays with a Reset Catalog button.

**What does setState do?** It notifies Flutter about a local state change and schedules rebuilding.

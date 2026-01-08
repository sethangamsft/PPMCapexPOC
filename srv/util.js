// /**
//  * ---------------------------------------------------------------------
//  * HIERARCHY LEVEL CALCULATOR
//  * ---------------------------------------------------------------------
//  */
// export  class HierarchyLevelCalculator {

//   constructor(items) {
//     this.items = items;
//     this.map = new Map(items.map(i => [i.code, i]));
//   }

//   getLevel(item) {
//     if (!item.parent_code) return 1;
//     const parent = this.map.get(item.parent_code);
//     if (!parent) return 1;
//     return 1 + this.getLevel(parent);
//   }

//   compute() {
//     return this.items.map(item => ({
//       ...item,
//       level: this.getLevel(item)
//     }));
//   }
// } 
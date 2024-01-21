export const diagramCreate = () => {

  const offset = 150;

  const items = loadItems();

  function loadItems() {
    const items = [

      { itemId: 1, itemName: "Understanding OCM (Component Object Model)", blockedBy: [] },
      { itemId: 2, itemName: "Formal Component Definition", blockedBy: [1] },
      { itemId: 3, itemName: "Component Interface Model", blockedBy: [2] },
      { itemId: 4, itemName: "Interface Formulation (Ini)", blockedBy: [3] },
      { itemId: 5, itemName: "Isomorphic Contribution to Data Visualization", blockedBy: [4]},
      { itemId: 6, itemName: "Relationship with Data", blockedBy: [5]},
      { itemId: 7, itemName: "Integration and Configuration", blockedBy: [6]},
      { itemId: 8, itemName: "Reference to Literature", blockedBy: [7]}
    ];

    const itemById = items.reduce((map, item) =>
      map.set(item.itemId, item), new Map()
    );
    items.forEach(item => {
      if (item.blockedBy && item.blockedBy.length > 0) {
        item.blockedBy = item.blockedBy.map(itemId => itemById.get(itemId));
      }
    });

    return sortTopologically(items);
  }

  function sortTopologically(unsortedItems) {
    const visited = new Set();
    const sortedItems = [];
    const visit = (item) => {
      if (visited.has(item)) return;
      visited.add(item);
      if (item.blockedBy && item.blockedBy.length > 0) {
        item.blockedBy.forEach(visit);
      }
      sortedItems.push(item);
    };
    unsortedItems.forEach(visit);
    return sortedItems;
  }

  function calculatePositions(length, currentPosition) {
    if (length === 1) {
      return [currentPosition];
    }
    let k = - (Math.ceil(length / 2) - 1);
    const positions = [];
    for (let i = 0; i < length; i++) {
      positions.push({
        x: currentPosition.x + 250 * k,
        y: currentPosition.y
      });
      k++;
    }
    return positions;
  }

  const connect = (shape1, shape2) => {
    miro.board.createConnector({
      shape: 'elbowed',
      start: {
        item: shape2.id,
      },
      end: {
        item: shape1.id,
      },
    });
  };
  

  const created = new Map();
  const draw = async (item, currentPosition) => {
    if (created.has(item)) return created.get(item);
    const miroItem = await miro.board.createShape({
      content: item.itemName,
      shape: 'round_rectangle',
      x: currentPosition.x,
      y: currentPosition.y
    });
    created.set(item, miroItem);

    if (item.blockedBy) {
      currentPosition.y += offset;
      const positions = calculatePositions(item.blockedBy.length, currentPosition);
      for (const blockingItem of item.blockedBy) {
        if (!created.has(blockingItem)) {
          await draw(blockingItem, positions.pop());
        }
        connect(miroItem, created.get(blockingItem));
      }
    }
    return miroItem;
  };

  async function execute() {
    let x = 0;
    let y = 0;
    for (const item of items) {
      const shape = await draw(item, { x, y });
      x = shape.x;
      y = shape.y + offset;
    }
  }

  execute().then(() =>
    created.clear()
  );
};
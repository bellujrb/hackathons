export const createFrameWithStick = async (list: any[]) => {
    try {
      const frame = await miro.board.createFrame({
        title: 'PDF Summary',
        style: {
          fillColor: '#ffffff',
        },
        x: 0,
        y: 0,
        width: 2000,
        height: 2000,
      });

      console.log(frame)
  
      const columns = 8;
      const spacingX = 220;
      const spacingY = 220;
  
      for (let i = 0; i < list.length; i++) {
        const row = Math.floor(i / columns);
        const col = i % columns;
  
        const stickyNote = await miro.board.createStickyNote({
          content: `<p>${String(list[i])}</p>`, 
          style: {
            fillColor: 'light_yellow',
            textAlign: 'center',
            textAlignVertical: 'middle',
          },
          x: -800 + col * spacingX,
          y: -800 + row * spacingY,
          shape: 'square',
          width: 200,
        });
        console.log(stickyNote);
      }
    } catch (error) {
      console.error('Error creating the card:', error);
    }
  };
  
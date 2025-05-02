const fx = require('fs');
fx.writeFileSync('testx.txt', 'Hello, world!', (err) => {
  if (err) {
    console.error('Error writing file:', err);
  } else {
    console.log('File written successfully');
  }
}
);
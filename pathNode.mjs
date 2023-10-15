import path from 'path'
import glob from 'glob'

const srcDir = process.argv[2]

//const [srcDir, dstDir] = process.argv.slice(2)
//const [srcDir] = process.argv.slice(2)
//console.log(srcDir)

//console.log(path.dirname(srcDir));

glob('srcDir/"node"', (err, files) => {
  if (err) {
    console.log(err)
  } else {
    for (const filename of files) {
      console.log(filename)
    }
  }
})
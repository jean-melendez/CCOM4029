import fs from 'fs'

var srcDir = process.argv[2]
//console.log("srcDir", srcDir, typeof srcDir)
  if (srcDir != "."){
    srcDir = "."
    console.log("Se te olvido poner un directorio como argumento.")
    console.log("Imprimiendo resultados del directorio actual.")
  }

fs.readdir(srcDir, (err, files) => {
  if (err) {
    console.error(err)
  } 
  else {
    for (const name of files) {
      console.log(name)
    }
  }
})
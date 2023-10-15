import glob from 'glob-promise'
import fs from 'fs-extra-promise'

const main = async (srcDir) => {
  const files = await glob(`${srcDir}/**/*.*`)
    const pairs = await Promise.all(files.map(f => statPair(f)))
    const filtered = await pairs.filter(pair => pair.stats.isFile())
    const filenames = await filtered.map(pair => pair.filename)
    const counts = await Promise.all(filenames.map(f => lineCount(f)))
    .then(counts => counts.forEach(
      c => console.log(`${c.lines}: ${c.name}`)))
    .catch(err => console.log(err.message))
}

const statPair = async(filename) => {
    const stats = await fs.statAsync(filename)
    return { filename, stats }
}
  


const lineCount = async (filename) => {
    const data = await fs.readFileAsync(filename, { encoding: 'utf-8' })
      return{
        name: filename,
        lines: data.split('\n').length - 1
      }
      
  }

const srcDir = process.argv[2]
main(srcDir)
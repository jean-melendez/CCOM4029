

[1000, 1500, 500].forEach(t => {
  console.log(`about to do nonBlocking for ${t}`)
  setImmediate(() => console.log(`inside timer handler for ${t}`))
})              
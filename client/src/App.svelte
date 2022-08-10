<script>
  const getData = async () => {
    const response = await fetch('http://localhost:3000/users')
    const data = await response.json()
    console.log(data)
  }
</script>

<main>
  <h1>Hello World</h1>
  <button on:click={getData}>
    Obtener datos
  </button>
</main>

<style>

</style>

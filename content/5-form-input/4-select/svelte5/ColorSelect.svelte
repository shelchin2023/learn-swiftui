<script>
  let selectedColorId = $state(2);

  const colors = [
    { id: 1, text: "red" },
    { id: 2, text: "blue" },
    { id: 3, text: "green" },
  ];
</script>

<select bind:value={selectedColorId}>
  {#each colors as color}
    <option value={color.id}>
      {color.text}
    </option>
  {/each}
</select>

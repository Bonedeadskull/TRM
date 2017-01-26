var filterStatus = true, filters, table;

window.onload = function() {
  filters = document.querySelector("#sidebar");
  table = document.querySelector("#main_content");
}

function toggleFilters() {
  if (filterStatus) {
    filters.style.display = "none";
    table.style['margin-right'] = "0";
  } else {
    filters.style.display = "";
    table.style['margin-right'] = "300px";
  }
}

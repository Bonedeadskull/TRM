var filterStatus = true, filters, table;

window.onload = function() {
  filters = querySelector("#sidebar");
  table = querySelector("#main_content");
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

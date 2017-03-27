var filterStatus = true, filters, table, button, cureButton;

window.onload = function() {
  filters = document.querySelector("#sidebar");
  table = document.querySelector("#main_content");
  button = document.querySelector("#filter_button");

}

function toggleFilters() {
  if (filterStatus) {
    filters.style.display = "none";
    table.style['margin-right'] = "0";
    button.innerText = "Show Filters";
  } else {
    filters.style.display = "";
    table.style['margin-right'] = "300px";
    button.innerText = "Hide Filters";
  }
  filterStatus = !filterStatus;
}

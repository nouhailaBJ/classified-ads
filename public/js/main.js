$(function () {
    // Summernote
    $('.textarea').summernote()
  })
$(document).ready(function () {
  bsCustomFileInput.init();
});
  $(function () {
    $("#example1").DataTable({
      "responsive": true,
      "autoWidth": false,
    });
  });
  $(function () {
    $(document).on('click', '[data-toggle="lightbox"]', function(event) {
      event.preventDefault();
      $(this).ekkoLightbox({
        alwaysShowClose: true
      });
    });

  })
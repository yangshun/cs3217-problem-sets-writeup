var converter = new Showdown.converter();

function refresh() {
    var $editor = $('.editor');
    var html = converter.makeHtml($editor.val());
    $('.preview').html(html);
}

function loadMarkdown() {
    var number = $('#selected-ps').val();
    $.get(makeFilePath(number), function(data) {
        $('.editor').val(data);
        refresh();
    })
}

$(function() {
    $('.editor').bind('input cut paste', function() {
        refresh();
    })
    $('#selected-ps').on('change', loadMarkdown);
    loadMarkdown();
});


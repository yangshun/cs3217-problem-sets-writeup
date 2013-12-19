var converter = new Showdown.converter();

$(function() {
    var $editor = $('.editor');
    $editor.bind('input cut paste', function() {
        var html = converter.makeHtml($editor.val());
        $('.preview').html(html);
    })
});
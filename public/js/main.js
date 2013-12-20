var converter = new Showdown.converter();

$(function() {
    for (var i = 1; i <= 5; i++) {
        var $div = $('<div></div>');
        $div.attr('class', 'ps-' + i.toString());
        appendContent($div);
        function appendContent($div) {
            $('.main-container').append($div);
            $.get(makeFilePath(i), function(data) {
                var html = converter.makeHtml(data);
                $div.append(html);
            });
        }
    }
});
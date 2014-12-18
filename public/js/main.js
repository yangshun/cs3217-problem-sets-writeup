var converter = new Showdown.converter();

$(function() {
    var PS_COUNT = 5;
    var count = 0;
    function appendContent($div) {
        $('.main-container').append($div);
        $.get(makeFilePath(i), function(data) {
            var html = converter.makeHtml(data);
            $div.append(html);
            count++;
            if (count === PS_COUNT) {
                $('pre code').each(function (i, block) {
                    hljs.highlightBlock(block);
                });
            }
        });
    }
    for (var i = 1; i <= PS_COUNT; i++) {
        var $div = $('<div></div>');
        $div.attr('class', 'ps-' + i.toString());
        appendContent($div);
    }
});
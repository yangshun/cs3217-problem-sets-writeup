var converter = new Showdown.converter();

(function() {
    for (var i = 1; i <= 1; i++) {
        var file_path = 'PS' + i.toString() + '/PS' + i.toString() + '.md';
        var $div = $('<div></div>');
        $div.attr('class', 'ps-' + i.toString());
        appendContent($div);
        function appendContent($div) {
            $('.main-container').append($div);
            $.get(file_path, function(data) {
                var html = converter.makeHtml(data);
                $div.append(html);
            });
        }
    }
})();
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

function saveDocument() {
    var number = $('#selected-ps').val();
    var content = $('.editor').val();
    $.post('/save', {
        ps: number,
        file_data: content
    }, function(res) {
        if (res == "success") {
            alert('File saved sucessfully!');
        }
    })
}

$(function() {
    $('.editor').bind('input cut paste', function() {
        refresh();
    })
    $('#selected-ps').on('change', loadMarkdown);
    $('#save-button').on('click', saveDocument);
    loadMarkdown();
});


var converter = new Showdown.converter();
var modified = false;
var current_selection = 1;

function refresh() {
    var $editor = $('.editor');
    var html = converter.makeHtml($editor.val());
    $('.preview').html(html);
}

function loadMarkdown() {
    if (modified) {
        var p = confirm('Content has been modified. Proceed without saving?');
    }
    if (p || !modified) {
        var number = $('#selected-ps').val();
        current_selection = number;
        $.get(makeFilePath(number), function(data) {
            $('.editor').val(data);
            refresh();
            setFileModificationStatus(false);
        })
    } else {
        $('#selected-ps').val(current_selection);
    }
}

function saveDocument() {
    var number = $('#selected-ps').val();
    var content = $('.editor').val();
    $.post('/save', {
        ps: number,
        file_data: content
    }, function(res) {
        if (res == "success") {
            setFileModificationStatus(false);
        }
    })
}

function resizeInnerContainers() {
    $('.inner-container').height($(window).height() - 100);   
}

function redirectToMain() {
    location.href = '/';
}

function setFileModificationStatus(state) {
    modified = state;
    if (modified) {
        $('.saving-status').text('There are unsaved changes.').removeClass('green');
    } else {
        $('.saving-status').text('All changes saved.').addClass('green');
    }
}

function bindShortcuts() {
    $(document).keydown(function(e) {
        if ((e.which == '115' || e.which == '83' ) && 
            (e.ctrlKey || e.metaKey)) {
            e.preventDefault();
            saveDocument();
            return false;
        }
        return true;
    });
}

$(function() {
    $('.editor').bind('input cut paste', function() {
        if (!modified) {
            setFileModificationStatus(true);
        }
        refresh();
    })
    $('#selected-ps').on('change', loadMarkdown);
    $('#save-button').on('click', saveDocument);
    loadMarkdown();
    $(window).resize(resizeInnerContainers);
    resizeInnerContainers();
    window.onbeforeunload = function() {
        if (modified) {
            return 'Content has been modified. Proceed without saving?';
        }
    }
    setFileModificationStatus(false);
    bindShortcuts();
});


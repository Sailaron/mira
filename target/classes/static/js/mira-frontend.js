var mainEntityClass = '';

jQuery(document).ready(function($) {
    mainEntityClass = $("body").attr('data-main-class');

    loadAllObjectsToPage(); // loading all objects from database to page
});

function enableInputChecking() {
    $("input").each(
        function () {
            this.onchange = checkInputOnEntering;
        }
    )
}

function checkInputOnEntering() {
    this.classList.remove('red-border');
}

function loadAllObjectsToPage() {
    if (mainEntityClass === 'task')
        loadProjectBoard($("body").attr('data-project-id'));
    else {
        $.ajax({
            url: '/' + mainEntityClass +'/all',
            type: 'post',
            success: function (data) {
                $("#body-content").html(data);
            },
            error: function (e) {
                console.log("ERROR: ", e);
            }
        });
    }
}

function downloadReadingList() {
    window.open( '/' + mainEntityClass + '/print');
}

function entityRemoving(objectId, specificClass = false) {
    var deletingClass = '';
    specificClass ? deletingClass = specificClass : deletingClass = mainEntityClass;
    $.ajax({
        url: '/' + deletingClass +'/remove',
        type: "post",
        data: "id=" + objectId,
        success: function (data) {
            hideForm('edit-entity-form');
            if (data === 'Not Found!') {
                alert('This data does not exist!');
            }
            if (deletingClass === 'project') {
                window.open('/project/');
            } else if (deletingClass === 'work-time') {
                $('#' + deletingClass + '-' + objectId).remove();
                hideForm('timelog-form');
            } else
                loadAllObjectsToPage();
        },
        error: function (e) {
            console.log("ERROR: ", e);
        }
    });
}

function openDataForm(objectId, isNewObjectRequired = false, className = undefined) {
    var userClass = '';
    className ? userClass = className : userClass = mainEntityClass;

    if (isNewObjectRequired && mainEntityClass === 'task' && className !== 'work-time') {
        objectId = $("body").attr('data-project-id');
    }

    $.ajax({
        url: '/' + userClass +'/form',
        type: "post",
        data: "id=" + objectId + "&adding=" + isNewObjectRequired,
        success: function (data) {
            if (data === 'Not Found!') {
                alert('This data does not exist!');
                loadAllObjectsToPage();
            } else {
                var formPlaceHtml = document.getElementById('data-form-place').innerHTML;
                formPlaceHtml += data;
                $("#data-form-place").html(formPlaceHtml);
                enableInputChecking();
            }
        },
        error: function (e) {
            console.log("ERROR: ", e);
        }
    });
}

function submitFilter(formId) {
    var form = $('#' + formId);

    $.ajax({
        url: form.attr("action"),
        type: form.attr("method"),
        data: form.serialize(),
        success: function (data) {
            $("#body-content").html(data);
            hideForm(formId);
        },
        error: function (e) {
            console.log("ERROR: ", e);
        }
    });
}

function submitDataForm(formId) {
    var isDataSet = true;
    var form = $('#' + formId);
    var inputs = $('#' + formId + ' .data');

    for (var i = 0; i < inputs.length; i++) {
        if(inputs[i].value === '' && inputs[i].getAttribute('data-default') !== 'empty') {
            inputs[i].classList.add('red-border');
            isDataSet = false;
        }
    }

    if(!isDataSet) {
        return;
    }

    var post_url = form.attr("action");       //get form action url
    var request_method = form.attr("method"); //get form GET/POST method
    var form_data = form.serialize();         //Encode form elements for submission

    $.ajax({
        url: post_url,
        type: request_method,
        data: form_data,
        success: function (data) {
            if (data === 'Saved') {
                if (post_url === '/project/save' && formId === 'edit-entity-form')
                    document.getElementById('page-title').textContent = inputs[0].value;

                hideForm(formId);
            } else {
                alert('Not saved! Message: ' . data);
            }
            loadAllObjectsToPage();
        },
        error: function (e) {
            console.log("ERROR: ", e);
        }
    });
}

function resetForm(formId) {
    var inputs = document.getElementById(formId)
        .getElementsByClassName('data');
    for (var i = 0; i < inputs.length; i++) {
        inputs[i].classList.remove('red-border');
        inputs[i].value = '';
    }
}

function hideForm(containerId) {
    if (containerId === 'add-entity-form') {
        $("#form-add-container").remove();
    } else if (containerId === 'edit-entity-form') {
        $("#form-edit-container").remove();
    } else if (containerId === 'timelog-form') {
        $("#timelog-container").remove();
    }
}

function openTimeFilter() {
    $.ajax({
        url: '/work-time/filter',
        type: 'post',
        success: function (data) {
            $("#body-content").html(data);
        },
        error: function (e) {
            console.log("ERROR: ", e);
        }
    });
}

function openProjectBoard(projectId, projectName) {
    var pageTitle = document.getElementById('page-title');
    pageTitle.textContent = projectName;
    var bodyContent = document.getElementById('body-content');
    bodyContent.classList.add('project-board');
    bodyContent.innerHTML = "";
    mainEntityClass = 'task';
    $("body").attr('data-project-id', projectId);

    loadProjectBoard(projectId);

    first = $('#action-buttons span').get(0); //.text('ADD NEW TASK');
    second = $('#action-buttons span').get(1); //.text('MAKE LIST OF ALL TASKS');
    first.innerText  = 'ADD NEW TASK';
    second.innerText = 'MAKE LIST OF ALL TASKS';
    var actionsHtml = document.getElementById('action-buttons').innerHTML;
    actionsHtml += "<a onclick=\"openDataForm('" + projectId + "', false, 'project')\">" +
        "<img src=\"/images/edit.png\" class=\"left-menu-image\"><span>EDIT</span></a>";

    $('#action-buttons').html(actionsHtml);
}

function loadProjectBoard(id) {
    $.ajax({
        url: '/project-board',
        type: "post",
        data: "id=" + id,
        success: function (data) {
            if (data === 'Not Found!') {
                alert('This data does not exist!');
            } else {
                $("#body-content").html(data);
            }
        },
        error: function (e) {
            console.log("ERROR: ", e);
        }
    });
}
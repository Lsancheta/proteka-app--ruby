//= require jquery
//= require jquery_ujs


function addFields(link, association, target ){
    var newId = new Date().getTime();
    var regexp = new RegExp('new_' + association, 'g');
    $(link).before($(target).append(
        $(link).data('fields').replace(regexp, newId)
    ));
}

function removeFields(link) {
    $(link).prev('input[type=hidden]').val('1');
    $(link).closest('.nested_fields').hide();
}
$(document).on('click', '.add-fields', function(e) {
    e.preventDefault();
    var target = $(this).data('target');
    var association = $(this).data('association');
    addFields(this, association, target);
});

$(document).on('click','.remove-fields', function(e) {
    e.preventDefault();
    removeFields(this);
});
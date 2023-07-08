window.addEventListener('message', function(event) {
    let data = event.data;

    switch (data.event) {
        case 'ShowUI':
            $("body").show();
        break;

        case 'HideUI':
            $("body").hide();
        break;

        case 'SpawnLabel':
            $(".name").html(data.label);
        break;
    }
});

function UpdateFuel(fuel) {
    var progressBar = document.getElementById('fuel-progress');
    progressBar.style.width = (fuel) + '%';
  }

  function UpdateEngine(engine) {
    var progressBar = document.getElementById('engine-progress');
    progressBar.style.width = (engine) + '%';
  }

window.addEventListener('message', function(event) {
    let data = event.data;

    switch (data.event) {
        case 'ShowUI':
            $("body").show();
        break;

        case 'HideUI':
            $("body").hide();
        break;

        case 'VehSpeed':
            $(".speed").html(data.speed);
            UpdateEngine(data.engine)
            UpdateFuel(data.fuel);
        break;

    }
});

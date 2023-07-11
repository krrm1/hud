var fuelLevel = 1.0;  // Starting fuel level (100%)

// Update the progress bar and fuel level
function updateProgressBar(fuel) {
  var progressBar = document.getElementById('fuel-progress');
  progressBar.style.width = (fuel) + '%';
}

// Decrease the fuel level and update the progress bar
function decreaseFuelLevel() {
  fuelLevel -= 0.1;  // Decrease fuel level by 10%
  if (fuelLevel < 0) {
    fuelLevel = 0;  // Clamp fuel level to minimum 0
  }
  updateProgressBar();
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
            updateProgressBar(data.fuel)
        break;
        
    }
});

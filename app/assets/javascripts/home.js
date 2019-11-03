function timer() {
  var id = document.querySelector("#time")
  console.log('id is', id);

  let new_time = new Date();
  console.log(new_time);
  let hours = new_time.getHours();
  console.log(hours);
  let minutes = new_time.getMinutes();
  console.log(minutes);
  let sec = new_time.getSeconds();
  console.log(sec);

  am_pm = hours >= 12 ? 'PM' : 'AM'
  time.innerHTML = `${hours} <span>:</span> ${minutes} <span>:</span> ${sec}`
  setTimeout(timer, 1000);
}

timer()
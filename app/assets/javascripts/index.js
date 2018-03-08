window.onload = function onLoad() {
    var circle = new ProgressBar.Circle('#prod_time_chart', {
        color: 'ghostwhite',
        duration: 2700,
        easing: 'easeInOut',
        strokeWidth: 8,
        trailWidth: 0.8,
        trailColor: 'black',
        text: {
          autoStyleContainer: 'false'
        },
        from: { color: '#FF2600', width: 0.8 },
        to: { color: '#98fb98', width: 4.5 },

 step: function(state, circle) {
    circle.path.setAttribute('stroke', state.color);
    circle.path.setAttribute('stroke-width', state.width);

    var value = Math.round(circle.value() * 100);
    if (value === 0) {
      circle.setText('');
    } else {
      circle.setText(value + '%');
    }
  }

    });

    circle.text.style.fontSize = '2rem';
    circle.animate(prod_time);

    var circle2 = new ProgressBar.Circle('#unprod_time_chart', {
        color: 'ghostwhite',
        duration: 2700,
        easing: 'easeInOut',
        strokeWidth: 8,
        trailWidth: 0.8,
        trailColor: 'black',
        text: {
          autoStyleContainer: 'false'
        },
        from: { color: '#98fb98', width: 4.5 },
        to: { color: '#FF2600', width: 4.5 },

  step: function(state, circle2) {
    circle2.path.setAttribute('stroke', state.color);
    circle2.path.setAttribute('stroke-width', state.width);

    var value = Math.round(circle2.value() * 100);
    if (value === 0) {
      circle2.setText('');
    } else {
      circle2.setText(value + '%');
    }
  }

    });

    circle2.text.style.fontSize = '2rem';
    circle2.animate(unprod_time);

    var circle2 = new ProgressBar.Circle('#sleep_time_chart', {
        color: 'ghostwhite',
        duration: 2700,
        easing: 'easeInOut',
        strokeWidth: 8,
        trailWidth: 0.8,
        trailColor: 'black',
        text: {
          autoStyleContainer: 'false'
        },
        from: { color: '#47A0FF', width: 3 },
        to: { color: '#00FDFF', width: 4.5 },

  step: function(state, circle2) {
    circle2.path.setAttribute('stroke', state.color);
    circle2.path.setAttribute('stroke-width', state.width);

    var value = Math.round(circle2.value() * 100);
    if (value === 0) {
      circle2.setText('');
    } else {
      circle2.setText(value + '%');
    }
  }

    });

    circle2.text.style.fontSize = '2rem';
    circle2.animate(sleep_time);

  //   var circle2 = new ProgressBar.SemiCircle('#happy_chart', {
  //       color: 'ghostwhite',
  //       duration: 2100,
  //       easing: 'bounce',
  //       background: 'yellow',
  //       strokeWidth: 8,
  //       trailWidth: 0.8,
  //       trailColor: 'black',
  //       text: {
  //         autoStyleContainer: 'false'
  //       },
  //       from: { color: '#47A0FF', width: 5 },
  //       to: { color: '#00FDFF', width: 5 },
  //
  // step: function(state, circle2) {
  //   circle2.path.setAttribute('stroke', state.color);
  //   circle2.path.setAttribute('stroke-width', state.width);
  //
  //   var value = Math.round(circle2.value() * 100);
  //   if (value === 0) {
  //     circle2.setText('');
  //   } else {
  //     circle2.setText(value + '%');
  //   }
  // }
  //
  //   });
  //
  //   circle2.text.style.fontSize = '2rem';
  //   circle2.animate(1);
};

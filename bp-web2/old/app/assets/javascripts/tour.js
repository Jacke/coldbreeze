define(['jquery', 'tether', 'shepherd'], function(jquery, tether,shepherd) {
var Shepherd = shepherd;
dashboardTour = new Shepherd.Tour({
      defaults: {
        classes: 'shepherd-element shepherd-open shepherd-theme-arrows',
        showCancelLink: true
      }
    });
dashboardTour.addStep('Dashboard counts', {
      text: ['This is counters for key metrics.', 'Now they all with zero, but later on they will increase.'],
      attachTo: '.roww.state-overview bottom',
      classes: 'shepherd shepherd-open shepherd-theme-arrows shepherd-transparent-text',
      buttons: [
        {
          text: 'Exit',
          classes: 'shepherd-button-secondary',
          action: dashboardTour.cancel
        }, {
          text: 'Next',
          action: dashboardTour.next,
          classes: 'shepherd-button-example-primary'
        }
      ]
    });
dashboardTour.addStep('Current sessions', {
      text: ['In that tab all active sessions will shown.'],
      attachTo: '.dashboard_sessions.col-md-8 top',
      classes: 'shepherd shepherd-open shepherd-theme-arrows shepherd-transparent-text',
      buttons: [
        {
          text: 'Exit',
          classes: 'shepherd-button-secondary',
          action: dashboardTour.cancel
        }, {
          text: 'Next',
          action: dashboardTour.next,
          classes: 'shepherd-button-example-primary'
        }
      ]
    });
dashboardTour.addStep('First service', {
      text: ['You need to create your <b>first service</b>.', 'That may be your primary industry task, like development of X. Customer interaction for Y etc..'],
      attachTo: '.dashboard_services.col-md-4',
      classes: 'shepherd shepherd-open shepherd-theme-arrows shepherd-transparent-text',
      buttons: [
        {
          text: 'Exit',
          classes: 'shepherd-button-secondary',
          action: dashboardTour.cancel
        }
      ]
    });


processModelTour = new Shepherd.Tour({
      defaults: {
        classes: 'shepherd-element shepherd-open shepherd-theme-arrows',
        showCancelLink: true
      }
    });
processModelTour.addStep('Form create', {
      text: ['You need to create your <b>first service</b>.', 'That may be your primary industry task, like development of X. Customer interaction for Y etc..'],
      attachTo: '.dashboard_services.col-md-4',
      classes: 'shepherd shepherd-open shepherd-theme-arrows shepherd-transparent-text',
      buttons: [
        {
          text: 'Exit',
          classes: 'shepherd-button-secondary',
          action: processModelTour.cancel
        }, {
          text: 'Next',
          action: processModelTour.next,
          classes: 'shepherd-button-example-primary'
        }
      ]
    });
processModelTour.addStep('Back to processes and launch it', {
      text: ['You need to create your <b>first service</b>.', 'That may be your primary industry task, like development of X. Customer interaction for Y etc..'],
      attachTo: '.dashboard_services.col-md-4',
      classes: 'shepherd shepherd-open shepherd-theme-arrows shepherd-transparent-text',
      buttons: [
        {
          text: 'Exit',
          classes: 'shepherd-button-secondary',
          action: processModelTour.cancel
        }, {
          text: 'Next',
          action: processModelTour.next,
          classes: 'shepherd-button-example-primary'
        }
      ]
});

return {
	dashboardTour: dashboardTour, processModelTour: processModelTour
}


});
Modules = new Meteor.Collection('modules');

/*
if (Modules.find().count() === 0) {

  var sample = [
    {
      title: "Module X",
      topics: [
        {
          title: "Topic A",
          _id: new Meteor.Collection.ObjectID()._str,
          slides: [
            {
              title: "Slide A"
            }, {
              title: "Slide B"
            }
          ]
        }, {
          title: "Topic B",
          _id: new Meteor.Collection.ObjectID()._str,
          slides: [
            {
              title: "Slide C"
            }
          ]
        }, {
          title: "Topic C",
          _id: new Meteor.Collection.ObjectID()._str,
          slides: [
            {
              title: "Slide D"
            }
          ]
        }
      ]
    },
    {
      title: "Module Y",
      topics: [
        {
          title: "Topic D",
          _id: new Meteor.Collection.ObjectID()._str,
          slides: [
            {
              title: "Slide E"
            }
          ]
        }, {
          title: "Topic E",
          _id: new Meteor.Collection.ObjectID()._str,
          slides: [
            {
              title: "Slide F"
            }
          ]
        }
      ]
    }
  ];

  _.each(sample, function(data) {
    Modules.insert(data);
  }) 
}
*/
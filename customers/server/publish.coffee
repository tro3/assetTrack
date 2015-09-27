
Meteor.publish 'customers', -> Customers.find()
Meteor.publish 'customer', (id) -> Customers.find({_id:id})
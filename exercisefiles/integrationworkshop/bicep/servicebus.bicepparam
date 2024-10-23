using 'servicebus.bicep'

//param namespaceName  = 'sb-eic-integration-pb2025'

param topicNameCreateStaff  = 'createstaff'
param subscriptionNameCreateStaff  = 'canvascreatestaff'

param topicNameCreateUser = 'createuser'
param subscriptionNameCreateUser = 'canvascreateuser'

param topicNameCreateTerm = 'createterm'
param subscriptionNameCreateTerm = 'canvascreateterm'

param topicNameCreateCourse = 'createcourse'
param subscriptionNameCreateCourse = 'canvascreatecourse'

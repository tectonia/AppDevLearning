param namespaceName string
param topicNameCreateStaff string
param subscriptionNameCreateStaff string

param topicNameCreateUser string
param subscriptionNameCreateUser string

param topicNameCreateTerm string
param subscriptionNameCreateTerm string

param topicNameCreateCourse string
param subscriptionNameCreateCourse string

resource sbNamespace 'Microsoft.ServiceBus/namespaces@2021-06-01-preview' = {
  name: namespaceName
  location: resourceGroup().location
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
}

resource sbTopicCreateStaff 'Microsoft.ServiceBus/namespaces/topics@2021-06-01-preview' = {
  parent: sbNamespace
  name: '${topicNameCreateStaff}'
  dependsOn: [
    sbNamespace
  ]
}

resource sbSubscriptionCreateStaff 'Microsoft.ServiceBus/namespaces/topics/subscriptions@2021-06-01-preview' = {
  parent: sbTopicCreateStaff
  name: '${subscriptionNameCreateStaff}'
  dependsOn: [
    sbTopicCreateStaff
  ]
}

//user
resource sbTopicCreateUser 'Microsoft.ServiceBus/namespaces/topics@2021-06-01-preview' = {
  parent: sbNamespace
  name: '${topicNameCreateUser}'
  dependsOn: [
    sbNamespace
  ]
}

resource sbSubscriptionCreateUser 'Microsoft.ServiceBus/namespaces/topics/subscriptions@2021-06-01-preview' = {
  parent: sbTopicCreateUser
  name: '${subscriptionNameCreateUser}'
  dependsOn: [
    sbTopicCreateUser
  ]
}
//term
resource sbTopicCreateTerm 'Microsoft.ServiceBus/namespaces/topics@2021-06-01-preview' = {
  parent: sbNamespace
  name: '${topicNameCreateTerm}'
  dependsOn: [
    sbNamespace
  ]
}

resource sbSubscriptionCreateTerm 'Microsoft.ServiceBus/namespaces/topics/subscriptions@2021-06-01-preview' = {
  parent: sbTopicCreateTerm
  name: '${subscriptionNameCreateTerm}'
  dependsOn: [
    sbTopicCreateTerm
  ]
}
//course
//term
resource sbTopicCreateCourse 'Microsoft.ServiceBus/namespaces/topics@2021-06-01-preview' = {
  parent: sbNamespace
  name: '${topicNameCreateCourse}'
  dependsOn: [
    sbNamespace
  ]
}

resource sbSubscriptionCreateCourse 'Microsoft.ServiceBus/namespaces/topics/subscriptions@2021-06-01-preview' = {
  parent: sbTopicCreateCourse
  name: '${subscriptionNameCreateCourse}'
  dependsOn: [
    sbTopicCreateCourse
  ]
}

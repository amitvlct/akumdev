trigger helloWorldTrigger on Account (before insert) {
system.debug('Hello Due To Trigger');
}
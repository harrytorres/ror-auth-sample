import { application } from "./application"

import HelloController from "./hello_controller"
application.start()
application.register("hello", HelloController)

// Eager load all controllers defined in the import map under controllers/**/*_controller
// import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)
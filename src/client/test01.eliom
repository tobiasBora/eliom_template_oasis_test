{shared{
  open Eliom_lib
  open Eliom_content
  open Html5.D
}}

module Myprog_app =
  Eliom_registration.App (
    struct
      let application_name = "myprog"
    end)

let main_service =
  Eliom_service.App.service ~path:[] ~get_params:Eliom_parameter.unit ()

let () =
  Myprog_app.register
    ~service:main_service
    (fun () () ->
      Lwt.return
        (Eliom_tools.F.html
           ~title:"My prog"
           ~css:[["css";"myprog.css"]]
           Html5.F.(body [
             h2 [pcdata "Welcome from Eliom's distillery!"];
           ])))

// ArtDialogResponse response = await ArtSweetAlert.show(
//                           barrierDismissible: false,
//                           context: context,
//                           artDialogArgs: ArtDialogArgs(
//                             showCancelBtn: true,
//                             denyButtonText: "Don't save",
//                             title: "Do you want to save the changes?",
//                             confirmButtonText: "Save",
//                           ));

//                       if (response.isTapConfirmButton) {
//                         ArtSweetAlert.show(
//                             context: context,
//                             artDialogArgs: ArtDialogArgs(
//                                 type: ArtSweetAlertType.success,
//                                 title: "Saved!"));
//                         return;
//                       } else if (response.isTapDenyButton) {
//                         ArtSweetAlert.show(
//                             context: context,
//                             artDialogArgs: ArtDialogArgs(
//                                 type: ArtSweetAlertType.info,
//                                 title: "Changes are not saved!"));
//                         return;
//                       } else {
//                         return;
//                       }
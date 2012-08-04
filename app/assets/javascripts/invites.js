// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require main

ST.invites = {
  accept: function(invite) {
    ST.invites.set_state(invite, "accepted");
  },
  reject: function(invite) {
    ST.invites.set_state(invite, "rejected");
  },
  pending: function(invite) {
    ST.invites.set_state(invite, "pending");
  },




  // Set state of invite by DOM of state link and string value of state
  //
  //
  set_state: function(invite, state) {
    var action_url = $(invite).parents("div").first().data("url"),
        invite_id = $(invite).parents("div").first().data("id");
    $.ajax({
      type: 'PUT',
      url: action_url,
      dataType: 'json',
      data: { 'id': invite_id, 'invite': {'state': state} },
      success: function(xhr) {
        ST.invites.set_visual_state($(invite).parent(), state);
      }
    });
  },

  // div - parent div which contains all links
  // state could be: accept, reject, pending
  set_visual_state: function(div, state) {
    var name = div.children("b").first().text();
    div.html("<b>" + name + "</b>" + "  "
      + ((state == "accepted") ? "<b>+1</b>" : "<a href=\"#\" class=\"accepted_invite\">+1</a>") + " "
      + ((state == "rejected") ? "<b>-1</b>" : "<a href=\"#\" class=\"rejected_invite\">-1</a>") + " "
      + ((state == "pending") ?  "<b>хз</b>" : "<a href=\"#\" class=\"pending_invite\">хз</a>")
    );
  }
};

$(function() {
        if ($("body").is($("body.new.admin_treatments"))) {
                $("fieldset.inputs > ol > li:nth-child(1)").after('<li class="warning" id="athlete-notes" style="display: none;"><label class="label">Notes</label><div style="width: 80%;">notes</div></li>');
                $("fieldset.inputs > ol > li:nth-child(1)").after('<li id="athlete-last-seen" style="display: none;"><label class="label">Last Seen</label><div style="width: 80%;"></div></li>');

                $("select#treatment_athlete_id").change(getTreatmentAthleteFields);
        } else if ($("body").is($("body.new.admin_injuries"))) {
                $("fieldset.inputs > ol > li:nth-child(1)").after('<li class="warning" id="athlete-notes" style="display: none;"><label class="label">Notes</label><div style="width: 80%;">notes</div></li>');
                $("fieldset.inputs > ol > li:nth-child(1)").after('<li id="athlete-last-seen" style="display: none;"><label class="label">Last Seen</label><div style="width: 80%;"></div></li>');

                $("select#injury_athlete_id").change(getInjuryAthleteFields);
        }
});

function getTreatmentAthleteFields() {
        var id = $("select#treatment_athlete_id").val();
        $.get("/user_notes/"+id, function(data) {
                if (data.length == 0) {
                        $("li#athlete-notes").hide();
                } else {
                        $("li#athlete-notes").show();
                        $("li#athlete-notes div").html(data);
                }
        });
        $.get("/user_last_seen/"+id, function(data) {
                if (data.length <= 1) {
                        $("li#athlete-last-seen").hide();
                } else {
                        $("li#athlete-last-seen").show();
                        $("li#athlete-last-seen div").html(data);
                }
        });
}

function getInjuryAthleteFields() {
        var id = $("select#injury_athlete_id").val();
        $.get("/user_notes/"+id, function(data) {
                if (data.length == 0) {
                        $("li#athlete-notes").hide();
                } else {
                        $("li#athlete-notes").show();
                        $("li#athlete-notes div").html(data);
                }
        });
        $.get("/user_last_seen/"+id, function(data) {
                if (data.length <= 1) {
                        $("li#athlete-last-seen").hide();
                } else {
                        $("li#athlete-last-seen").show();
                        $("li#athlete-last-seen div").html(data);
                }
        });
}





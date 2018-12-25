var major_sel = 0;
var school_sel = 0;
var school_url = "https://"+window.location.hostname + Routes.schools_path();
var major_url = "https://"+window.location.hostname + Routes.majors_path();
var grade_url = "https://"+window.location.hostname + Routes.grades_path();
$(document).ready(function(){
  $('#student_university_id').select2();
  $('#student_grade_id').select2({
    minimumResultsForSearch: -1
  });
  $('#student_major_interest_id').select2();
  if (major_sel == 0){
    $('#student_major_interest_id').prop("disabled", true);
  }else{
    $('#student_major_interest_id').prop("disabled", false);
  }
  $('#student_school_id').select2(select_school());
  if (school_sel == 0){
    $('#student_grade_id').prop("disabled", true);
  }else{
    $('#student_grade_id').prop("disabled", false);
  }
});

$('#student_university_id').on('select2:select', function() {
  major_sel = $(this).val();
  if (major_sel > 0){
    $('#student_major_interest_id').prop("disabled", false);
    select_major();
  }else{
    $('#student_major_interest_id').prop("disabled", true);
  }
});

$('#student_school_id').on('select2:select', function() {
  $('#student_grade_id').prop("disabled", false);
  var school = document.getElementById("select2-student_school_id-container").title.toString().split(' ');
  switch (school[0]){
    case 'SMP':
    case 'SMPN':
      select_grade(0);
      break;
    case 'SMA':
    case 'SMAN':
      select_grade(1);
      break;
    default:
      select_grade(-1);
      $('#student_grade_id').prop("disabled", true);
      break;
  }
});

function select_grade(grade){
  $('#student_grade_id').select2({
    ajax : {
      url: grade_url,
      dataType: 'json',
      data: function () {
        var query = {
          grade: grade
        }
        return query;
      },
      processResults: function (data) {
        return {
          results: $.map(data, function(obj) {
            return { id: obj.id, text: obj.gradeName };
          })
        };
      }
    },
    minimumResultsForSearch: -1
  });
}

function select_school(){
  return {
    ajax : {
      url: school_url,
      dataType: 'json',
      processResults: function (data) {
        return {
          results: $.map(data, function(obj) {
            return { id: obj.id, text: obj.schoolName };
          })
        };
      }
    }
  };
}

function select_major(){
  $('#student_major_interest_id').select2({
    ajax : {
      url: major_url,
      dataType: 'json',
      data: function () {
        var query = {
          major: major_sel
        }
        return query;
      },
      processResults: function (data) {
        return {
          results: $.map(data, function(obj) {
            return { id: obj.id, text: obj.majors };
          })
        };
      }
    }
  });
}

;

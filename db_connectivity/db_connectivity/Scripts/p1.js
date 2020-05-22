
var teamName;

function getTeamName(tagName) {
    $.ajax({
        type: "post",
        url: "/Home/setPreference",
        data: {
            preference: tagName 
        },
        success: function (response) {
            location.href = 'LiveScore';
            console.log('Hey there');
            console.log(response);
        }
    });
}
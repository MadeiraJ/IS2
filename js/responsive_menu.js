/**
 * Created by Fábio on 31/01/2018.
 */

/*jQuery(document).ready(function() {
    jQuery('.toggle-nav').click(function(e) {
        jQuery(this).toggleClass('active');
        jQuery('.navbar ul').toggleClass('active');
        jQuery('forum').toggleClass('active');
        e.preventDefault();
    });
});*/

function toggleSidebar(ref) {
    ref.classList.toggle('active');
    document.getElementById('sidebar').classList.toggle('active');
}

function mostraMenu(){
    if (document.getElementById("submenuSlide").style.display == "none"){
        document.getElementById("submenuSlide").style.display = "block";
        document.getElementById("menuTemas").style.backgroundColor = "#DBF0FD";
    }
    else {
        document.getElementById("submenuSlide").style.display = "none";
        document.getElementById("menuTemas").style.backgroundColor = "#F7FAFC";
    }
}
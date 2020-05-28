//scrape data from Linkedin Sales Navigator list

listings = Array.from(document.getElementsByTagName("dl")).slice(0, 25)
for(l of listings) {
    if(l.hasAttribute("role")) {
        person_link = l.getElementsByClassName("lists-detail__view-profile-name-link")[0]
        name = person_link.textContent.trim()+"\n"
        link = "https://linkedin.com/"+person_link.getAttribute("href").trim()+"\n"
        title = l.getElementsByClassName("Sans-14px-black-90%")[0].textContent.trim()+"\n"
        console.log(name, link, title)
    }
}
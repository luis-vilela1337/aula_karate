package examples.users;

import com.intuit.karate.junit5.Karate;

class UsersRunner {
    
    @Karate.Test
    Karate testStarWars() {
        return Karate.run("star_wars").relativeTo(getClass());
    }    

}

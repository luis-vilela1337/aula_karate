package aula_inatel.star_wars;

import com.intuit.karate.junit5.Karate;

class SwRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("sw").relativeTo(getClass());
    }

}

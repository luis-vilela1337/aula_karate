package aula_inatel.jsonplaceholder;

import com.intuit.karate.junit5.Karate;

class JsonplaceholderRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("jsonplaceholder").relativeTo(getClass());
    }

}

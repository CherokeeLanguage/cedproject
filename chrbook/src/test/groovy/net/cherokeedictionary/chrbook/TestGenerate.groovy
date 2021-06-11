package net.cherokeedictionary.chrbook

import junit.framework.TestCase
import net.cherokeedictionary.chrbook.sections.ColorsSection

class TestGenerate extends TestCase {
    void testGenerate() {
        def colorSection = new ColorsSection()
        colorSection.title = "this is the title"
    }
}

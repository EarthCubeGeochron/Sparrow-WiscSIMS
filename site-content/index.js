import {Markdown} from '@macrostrat/ui-components'
import aboutText from './about-the-lab.md'
import h from 'react-hyperscript'

export default {
  landingText: h(Markdown, {src: aboutText}),
  siteTitle: process.env.SPARROW_LAB_NAME
}
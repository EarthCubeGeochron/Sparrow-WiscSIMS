import { Markdown } from "@macrostrat/ui-components";
import aboutText from "./about-the-lab.md";
import h from "react-hyperscript";
import { MountMapChart } from "plugins/mount-plots";
import { DtfaMountChart } from "plugins/dtfa-plot";
import { IPtimeChart } from "plugins/IP-time";
import { GLMap } from "plugins/gl-map";
import { Tab, Tabs } from "sparrow/components/tab-panel";

export default {
  siteTitle: process.env.SPARROW_LAB_NAME,
  landingText: h(Markdown, { src: aboutText }),
  sessionDetail: (props) => {
    const { defaultContent, ...rest } = props;
    return h(
      Tabs,
      {
        id: "sessionDetailTabs",
      },
      [
        h(
          Tab,
          { id: "mountMap", panel: h(MountMapChart, rest) },
          "Mount Map Chart"
        ),
        h(
          Tab,
          { id: "dtfaChart", panel: h(DtfaMountChart, rest) },
          "DTFA Chart"
        ),
        h(Tab, { id: "ipChart", panel: h(IPtimeChart, rest) }, "IP Chart"),
        h(
          Tab,
          { id: "analysisDetails", panel: h(defaultContent, rest) },
          "Analysis details"
        ),
      ]
    );
  },
};

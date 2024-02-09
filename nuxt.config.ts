// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  modules: ['nuxt-edgedb-module', "@nuxt/ui"],
  edgeDb: {
    auth: true,
    // generateInterfaces: false,
    // generateQueries: false,
    // generateQueryBuilder: false,
    // generateQuiet: false,
    // installCli: false,
    // projectInit: false,
  }
})

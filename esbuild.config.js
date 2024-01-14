require('esbuild').build({
    entryPoints: ['app/javascript/application.js'],
    bundle: true,
    sourcemap: true,
    watch: process.argv.includes("--watch"),
    outdir: 'app/assets/builds',
}).catch(() => process.exit(1))

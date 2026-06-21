import os
import hashlib
import requests
import json
import tomli
import tomli_w

if __name__ == "__main__":
    returndir = os.getcwd()
    os.chdir("mods")

    mods:dict = {}
    
    print("Сканирование файлов...")
    for path in os.scandir():
        if not path.is_file: continue

        if path.name.endswith('.jar'):
            with open(path.path,'br') as jar:
                hash = hashlib.sha1(jar.read()).hexdigest()
                mods[hash] = {'filename':path.name, 'local':path.path}
        elif path.name.endswith('.disabled'):
            os.remove(path.path)
    
    print("Запрос версий на Modrinth...")
    modrinthVersions:dict = requests.post("https://api.modrinth.com/v2/version_files", json={"hashes":list(mods), "algorithm": "sha1"}).json()
    modrinthProjectsToHashes:dict = {}
    for hash, version in modrinthVersions.items():
        for file in version['files']:
            if file['hashes']['sha1'] == hash:
                mods[hash]['download'] = {
                    'hash-format':'sha1',
                    'hash':hash,
                    'url':file['url']
                }
                mods[hash]['update'] = {'modrinth':{
                    'mod-id':version['project_id'],
                    'version':version['id']
                }}
                modrinthProjectsToHashes[version['project_id']] = hash
                break
    
    print("Запрос проектов на Modrinth...")
    modrinthProjects:dict = requests.get("https://api.modrinth.com/v2/projects",params={'ids':json.dumps(list(modrinthProjectsToHashes))}).json()
    for project in modrinthProjects:
        hash = modrinthProjectsToHashes[project['id']]
        mod:dict = mods[hash]
        mod['name'] = project['title']
        mod['side'] = ["both","server","client"][(project['client_side'] == "unsupported")|(project['server_side'] == "unsupported")<<1]
        if 'local' in mod:
            os.remove(mod['local'])
            del mod['local']
        try:
            toml = open(project['slug']+'.pw.toml','br+')
            previous = tomli.load(toml)
            previous.update(mod)
            mod = previous
            toml.seek(0)
        except:
            toml = open(project['slug']+'.pw.toml','bw')
        tomli_w.dump(mod,toml)
        toml.truncate()
        toml.close()
        del mods[hash]

    print("Не найдены на Modrinth:")
    for mod in mods.values(): print(mod['filename'])
    os.chdir(returndir)
    
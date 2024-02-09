<template>
  <UContainer>
    <!-- See all the comments -->
    <UTable :rows="data" :columns="[{ key: 'text', label: 'Comment' }]">
      <template #text-data="{ row }">
        <span class="flex flex-row items-center gap-2">
          <span class="rounded-full h-2 w-2" :class="{ 'bg-green-400': row.isCurrent }" title="My comment">
            <span v-if="row.isCurrent" class="sr-only">My comment</span>
          </span>
          <span class="mr-auto">
            {{ row.text }}
          </span>
          <UButton v-if="row.isCurrent" @click="deleteComment(row.id)"  icon="i-heroicons-trash" size="xs" color="red" variant="solid" :trailing="false" />
        </span>
      </template>
    </UTable>
    <UDivider class="my-4" />
    <!-- Add a new comment -->
    <div v-if="!isLoggedIn" class="flex flex-row gap-2">
      <UButton to="/auth/login">Login</UButton>
      <UButton to="/auth/signup">Sign up!</UButton>
    </div>
    <UForm v-else :state="state" class="space-y-4" @submit="onSubmit">
      <UFormGroup label="Comments on the conference" name="text">
        <UTextarea v-model="state.text" />
      </UFormGroup>
      <UFormGroup label="Mark as public" name="public">
        <UCheckbox v-model="state.public" />
      </UFormGroup>

      <UButton type="submit">
        Submit
      </UButton>
    </UForm>
  </UContainer>
</template>

<script setup lang="ts">
import type { FormSubmitEvent } from '#ui/types'

const { isLoggedIn } = useEdgeDbIdentity()
const { data, refresh } = await useFetch('/api/comments')

const state = reactive({
  text: undefined,
  public: true
})

async function onSubmit (event: FormSubmitEvent<any>) {
  const result = await $fetch('/api/comment', {
    method: 'POST',
    body: state
  })
  console.log(({ result }))
  refresh()
}

async function deleteComment(id: string) {
  await $fetch(`/api/comment/${id}`, {
    method: 'DELETE',
  })
  refresh()
}
</script>
